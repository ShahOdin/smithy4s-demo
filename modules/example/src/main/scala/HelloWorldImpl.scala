import smithy4s.hello._
import cats.effect._

object HelloWorldImpl extends HelloWorldService[IO] {
  def hello(name: String, town: Option[Town]): IO[Greeting] = IO
    .whenA(name == "Balrog")(
      IO.raiseError(YouShallNotPass(s"Go back to the Shadow"))
    ).as(
    town match {
      case None => Greeting(s"Hello $name!")
      case Some(t) => Greeting(s"Hello $name from $t!")
    }
  )

  override def choice(pill: Pill): IO[Consequence] = IO.pure(
    pill match {
      case Pill.Wisdom =>
        Consequence("The story ends, you wake up in your bed and believe whatever you want to believe")
      case Pill.Ignorance =>
        Consequence("You stay in wonderland, and I show you how deep the rabbit hole goes.")
    }
  )
}
