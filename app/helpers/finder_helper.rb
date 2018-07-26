module FinderHelper
    def get_fresh_feed
        request_url = ENV['NORTA_REQUEST_URL']

        # As of 2018-07-26, NORTA provides a GTFS zip file inside of another zip file. We need to temporarily extract it to get the guts.

        # First, get the outer ZIP file and return the body to a string
        norta_feed_response = HTTParty.get(request_url).body

        # Next, read the string into the Zip file reader and get its first entry as an input stream
        zip_entry = Zip::File.open_buffer(norta_feed_response).entries.first.get_input_stream.read

        # Extract the inner zip into a temporary file
        temp_file_write = File.binwrite('tmp/temp.zip', zip_entry)
    end
    
    def get_feed
        # Finally, read this into a GTFS object
        norta_gtfs = GTFS::Source.build('tmp/temp.zip')
        return norta_gtfs
    end
    
    def push_agency
        feed = get_feed
        if Agency.all.length == 0
            feed.agencies.each do |agency|
                Agency.create(
                    agency_name: agency.agency_name,
                    agency_url: agency.agency_url,
                    agency_timezone: agency.agency_timezone,
                    agency_lang: agency.agency_lang,
                    agency_phone: agency.agency_phone,
                    agency_fare_url: agency.agency_fare_url
                )
            end
        end
    end
    
    def push_calendar
        feed = get_feed
        if Calendar.all.length == 0
            feed.calendars.each do |calendar|
                days = []
                days.push("sunday") if calendar.sunday == "1"
                days.push("monday") if calendar.monday == "1"
                days.push("tuesday") if calendar.tuesday == "1"
                days.push("wednesday") if calendar.wednesday == "1"
                days.push("thursday") if calendar.thursday == "1"
                days.push("friday") if calendar.friday == "1"
                days.push("saturday") if calendar.saturday == "1"
                puts days
                Calendar.create(
                    service_id: calendar.service_id,
                    start_date: calendar.start_date,
                    end_date: calendar.end_date,
                    days: days
                )
            end
        end
    end

    def push_feed_info
        feed = get_feed
        if FeedInfo.all.length == 0
            feed.feed_infos.each do |feed_info|
                FeedInfo.create(
                    feed_publisher_name: feed_info.feed_publisher_name,
                    feed_publisher_url: feed_info.feed_publisher_url,
                    feed_lang: feed_info.feed_lang,
                    feed_start_date: feed_info.feed_start_date,
                    feed_end_date: feed_info.feed_end_date,
                    feed_version: feed_info.feed_version
                )
            end
        end
    end

    def push_routes
        feed = get_feed
        if Route.all.length == 0
            feed.routes.each do |route|
                Route.create(
                    route_id: route.route_id,
                    agency_id: route.agency_id,
                    route_short_name: route.route_short_name,
                    route_long_name: route.route_long_name,
                    route_desc: route.route_desc,
                    route_type: route.route_type,
                    route_color: route.route_color,
                    route_text_color: route.route_text_color
                )
            end
        end
    end

    def push_shapes
        # TODO: Fix this - is there a problem with the loop? All transactions keep rolling back
        feed = get_feed
        if Shape.all.length == 0
            feed.shapes.each do |shape|
                Shape.create(
                    shape_id: shape.shape_id,
                    shape_pt_lat: shape.shape_pt_lat,
                    shape_pt_lon: shape.shape_pt_lon,
                    shape_pt_sequence: shape.shape_pt_sequence,
                    shape_dist_traveled: shape.shape_dist_traveled
                )
            end
        end
    end

    def push_database
    end
end 