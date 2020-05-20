# Reactor - Fiber Handler

A fiber-based handler loop.

## Usage

Subclass the `Reactor::FiberHandler` class and define the `#run` method.

The method accepts the dispatcher (Reactor::Dispatcher), event (Symbol)
and handle (IO).

The dispatcher reference can be used to register new handlers
for custom events.

Method should return `nil` or `false` if the handler should break out of the
handling loop.

```
class PutsHandler < Reactor::FiberHandler
  def run(reactor, event, handle)
    puts "#{event} occured on #{handle}"
  end
end
```
