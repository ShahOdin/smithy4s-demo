import smithy4s.hello._
import cats.effect._

object HelloWorldImpl extends HelloWorldService[IO] {
  def hello(name: String): IO[Unit] = IO.whenA(name == "Balrog")(
      IO.raiseError[Unit](YouShallNotPass(s"Go back to the Shadow"))
  )
}
