module Reactor
  class FiberHandler
    attr_reader :context

    def initialize(context = {})
      @context = context
      @handler = handler
    end

    def call(reactor, handle, event)
      @handler.resume(reactor, handle, event)
    end

    def handler
      Fiber.new do |reactor, handle, event|
        loop do
          run(reactor, handle, event) || break

          reactor, handle, event = Fiber.yield
        end
      end
    end

    # Returning false/nil breaks out of the handler loop (catch is not available in
    # mruby and exceptions might be too heavy)
    def run(reactor, event, handle)
      raise "Override me"
    end
  end
end
