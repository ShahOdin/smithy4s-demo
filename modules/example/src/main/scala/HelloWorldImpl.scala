import smithy4s.hello._
import cats.effect._

object HelloWorldImpl extends HelloWorldService[IO] {
  def hello(name: String, town: Option[String]): IO[Greeting] = for {
    _ <- IO.whenA(name == "Balrog")(
      IO.raiseError (YouShallNotPass (s"Go back to the Shadow"))
    )
  } yield town match {
    case None => Greeting(s"Hello $name!")
    case Some(t) => Greeting(s"Hello $name from $t!")
  }
}
