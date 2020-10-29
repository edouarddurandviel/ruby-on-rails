module ApplicationHelper


    def std_name
        "PhotoList"
    end

    def upFormat(args)
        @upFormat = "#{args.upcase} !!! " + args
    end

    def joinObjects(*args)
        @joinObject = args[0] + " " + args[1]
        @joinObject.to_s
    end

end
