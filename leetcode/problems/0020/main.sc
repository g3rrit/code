//implicit class AnyEx[T](val v: T) extends AnyVal {
//    def |>[U](f: T ⇒ U): U = f(v)
//}

import scala.util.chaining._

object Solution {

    def eFoldLeft[A, B](xs: Seq[A], z: B)(op: (B, A) => (Boolean, B)): (Boolean, B) = {
        def f(xs: Seq[A], acc: (Boolean, B)): (Boolean, B) = ((acc._1, xs): @unchecked) match {
            case (false, _)   => acc
            case (_, Seq())   => acc
            case (_, x +: xs) => f(xs, op(acc._2, x))
        }
        f(xs, (true, z))
    }

    def isValid(s: String): Boolean = {
        eFoldLeft(s, "") { (ss, c) =>
            {
                c match {
                    case '(' | '{' | '[' => (true, ss + c)
                    case ')'             => (ss.length >= 1 && '(' == ss(ss.length - 1), ss.dropRight(1))
                    case '}'             => (ss.length >= 1 && '{' == ss(ss.length - 1), ss.dropRight(1))
                    case ']'             => (ss.length >= 1 && '[' == ss(ss.length - 1), ss.dropRight(1))
                }
            }
        }.pipe(res => res._1 && res._2.length == 0)
    }
}
