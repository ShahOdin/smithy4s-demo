import cats.effect._
import org.http4s.implicits._
import org.http4s.ember.server._
import com.comcast.ip4s._

object Main extends IOApp.Simple {

  val run = Routes.all
    .flatMap { routes =>
      EmberServerBuilder
        .default[IO]
        .withPort(port"9000")
        .withHost(host"localhost")
        .withHttpApp(routes.orNotFound)
        .build
    }
    .use(_ => IO.never)

}
