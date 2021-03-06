open Core.Std
open Async.Std

module Hardcoded : sig
  val port : int
end

type t

val create
  :  unit
  -> t Deferred.t

val set_callbacks
  :  t
  -> process_headers : (node:Node.t -> headers:Header.t list -> unit)
  -> unit

val add_node
  :  t
  -> ipv4_address : string
  -> port : int
  -> unit

val close : t -> unit

val connected_nodes : t -> Node.t list

val known_nodes : t -> Node.t list
