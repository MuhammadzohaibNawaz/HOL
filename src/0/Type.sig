signature Type =
sig
  type tyvar    = KernelTypes.tyvar
  type rank     = KernelTypes.rank
  type kind     = KernelTypes.kind
  type hol_type = KernelTypes.hol_type
  val typesig       : kind KernelSig.symboltable

  val kind_of       : hol_type -> kind
  val kd_of         : hol_type -> kind list -> kind
  val rk_of         : hol_type -> kind list -> rank
  val prim_kind_of  : {Thy:string,Tyop:string} -> kind
  val rank_of_type  : hol_type -> rank
  val rank_of_univ_dom : hol_type -> rank
  val rank_of_exist_dom : hol_type -> rank
  val check_kind_of : hol_type -> kind
  val is_well_kinded: hol_type -> bool
  val kind_vars     : hol_type -> kind list
  val kind_varsl    : hol_type list -> kind list
  val inst_rank     : rank -> hol_type -> hol_type
  val inst_kind     : (kind,kind)Lib.subst -> hol_type -> hol_type
  val inst_rank_kind : rank -> (kind,kind)Lib.subst -> hol_type -> hol_type
  val mk_vartype    : string -> hol_type
  val mk_var_type   : tyvar -> hol_type
  val mk_primed_vartype : string -> hol_type
  val mk_primed_var_type : tyvar -> hol_type
  val gen_tyvar     : unit -> hol_type
  val gen_var_type  : kind -> hol_type
  val variant_type  : hol_type list -> hol_type -> hol_type
  val variant_tyvar : hol_type list -> tyvar -> tyvar
  val prim_variant_type : hol_type list -> hol_type -> hol_type
  val dest_vartype  : hol_type -> string
  val dest_var_type : hol_type -> tyvar
  val is_vartype    : hol_type -> bool
  val is_var_type   : hol_type -> bool
  val is_bvartype   : hol_type -> bool
  val is_gen_tyvar  : hol_type -> bool

  val op_arity      : {Thy:string,Tyop:string} -> int option
  val op_kind       : {Thy:string,Tyop:string} -> kind option
  val op_rank       : {Thy:string,Tyop:string} -> rank option
  val mk_type       : string * hol_type list -> hol_type
  val dest_type     : hol_type -> string * hol_type list
  val break_type    : hol_type -> KernelTypes.tyconst * hol_type list
  val decls         : string -> {Thy:string, Tyop:string} list
  val is_type       : hol_type -> bool
  val mk_thy_type   : {Thy:string, Tyop:string, Args:hol_type list} -> hol_type
  val dest_thy_type : hol_type -> {Thy:string, Tyop:string, Args:hol_type list}

  val prim_mk_con_type : string -> hol_type
  val prim_mk_thy_con_type : {Thy:string, Tyop:string} -> hol_type
  val mk_con_type   : {Tyop:string, Kind:kind} -> hol_type
  val mk_thy_con_type : {Thy:string, Tyop:string, Kind:kind} -> hol_type
  val dest_con_type : hol_type -> string * kind
  val dest_thy_con_type : hol_type -> {Thy:string, Tyop:string, Kind:kind}
  val is_con_type   : hol_type -> bool
  val mk_app_type   : hol_type * hol_type -> hol_type
  val list_mk_app_type : hol_type * hol_type list -> hol_type
  val dest_app_type : hol_type -> hol_type * hol_type
  val strip_app_type: hol_type -> hol_type * hol_type list
  val is_app_type   : hol_type -> bool

  val mk_univ_type  : hol_type * hol_type -> hol_type
  val list_mk_univ_type : hol_type list * hol_type -> hol_type
  val list_mk_univ_type_binder : hol_type option -> string -> hol_type list * hol_type -> hol_type
  val dest_univ_type: hol_type -> hol_type * hol_type
  val strip_univ_type : hol_type -> hol_type list * hol_type
  val is_univ_type  : hol_type -> bool

  val mk_exist_type  : hol_type * hol_type -> hol_type
  val list_mk_exist_type : hol_type list * hol_type -> hol_type
  val list_mk_exist_type_binder : hol_type option -> string -> hol_type list * hol_type -> hol_type
  val dest_exist_type: hol_type -> hol_type * hol_type
  val strip_exist_type : hol_type -> hol_type list * hol_type
  val is_exist_type  : hol_type -> bool

  val mk_abs_type   : hol_type * hol_type -> hol_type
  val list_mk_abs_type : hol_type list * hol_type -> hol_type
  val list_mk_abs_type_binder : hol_type option -> string -> hol_type list * hol_type -> hol_type
  val dest_abs_type : hol_type -> hol_type * hol_type
  val strip_abs_type: hol_type -> hol_type list * hol_type
  val is_abs_type   : hol_type -> bool

  val aconv_ty      : hol_type -> hol_type -> bool
  val beta_conv_ty  : hol_type -> hol_type
  val head_beta_ty  : hol_type -> hol_type
  val head_beta_eta_ty : hol_type -> hol_type
  val deep_beta_ty  : hol_type -> hol_type
  val eta_conv_ty   : hol_type -> hol_type
  val deep_eta_ty   : hol_type -> hol_type
  val deep_beta_eta_ty : hol_type -> hol_type
(* val vacuum        : hol_type -> hol_type *)
  val abconv_ty     : hol_type -> hol_type -> bool
  val abeconv_ty    : hol_type -> hol_type -> bool
  val eq_ty         : hol_type -> hol_type -> bool
  val ge_ty         : hol_type -> hol_type -> bool
(* val subtype       : hol_type -> hol_type -> bool *)
  val polymorphic   : hol_type -> bool
  val universal     : hol_type -> bool
  val existential   : hol_type -> bool
  val abstraction   : hol_type -> bool
  val is_omega      : hol_type -> bool
(* val kind_rank_compare : (kind * int) * (kind * int) -> order *)
  val tyvar_compare : tyvar * tyvar -> order
  val compare       : hol_type * hol_type -> order
  val prim_compare  : hol_type * hol_type -> order
  val tyvar_eq      : tyvar -> tyvar -> bool
  val type_eq       : hol_type -> hol_type -> bool
  val empty_tyset   : hol_type  HOLset.set

  val ty_sub          : (hol_type,hol_type)Lib.subst -> hol_type -> hol_type Lib.delta
  val pure_type_subst : (hol_type,hol_type)Lib.subst -> hol_type -> hol_type (* expects kinds, ranks match *)
  val type_subst      : (hol_type,hol_type)Lib.subst -> hol_type -> hol_type (* aligns kinds, ranks to match *)
  val full_type_subst : (hol_type,hol_type)Lib.subst -> hol_type -> hol_type (* redexes can be expressions *)
  val inst_rk_kd_ty : rank -> (kind,kind)Lib.subst -> (hol_type,hol_type)Lib.subst
                        -> hol_type -> hol_type
  val type_vars     : hol_type -> hol_type list
  val type_varsl    : hol_type list -> hol_type list
  val type_vars_lr  : hol_type -> hol_type list
  val type_var_in   : hol_type -> hol_type -> bool
  val exists_tyvar  : (hol_type -> bool) -> hol_type -> bool
  val mk_fun_type   : hol_type * hol_type -> kind list -> hol_type
  val -->           : hol_type * hol_type -> hol_type  (* infixr 3 --> *)
  val dom_rng       : hol_type -> hol_type * hol_type  (* inverts -->  *)
  val raw_dom_rng   : hol_type -> hol_type * hol_type  (* inverts -->  *)
  val ind           : hol_type
  val bool          : hol_type
  val alpha         : hol_type
  val beta          : hol_type
  val gamma         : hol_type
  val delta         : hol_type
  val etyvar        : hol_type
  val ftyvar        : hol_type

  val match_type    : hol_type -> hol_type -> (hol_type,hol_type)Lib.subst
  val kind_match_type  : hol_type -> hol_type ->
                         (hol_type,hol_type)Lib.subst * (kind,kind)Lib.subst * rank
  val kind_match_types : (hol_type,hol_type) Lib.subst ->
                         (hol_type,hol_type)Lib.subst * (kind,kind)Lib.subst * rank

  val raw_match_type : hol_type -> hol_type
                      -> (hol_type,hol_type) Lib.subst * hol_type list
                      -> (hol_type,hol_type) Lib.subst * hol_type list
  val raw_kind_match_type : hol_type -> hol_type
                      -> ( (hol_type,hol_type) Lib.subst * hol_type list ) *
                         ( (kind,kind) Lib.subst * kind list ) * (rank * bool)
                      -> ( (hol_type,hol_type) Lib.subst * hol_type list ) *
                         ( (kind,kind) Lib.subst * kind list ) * (rank * bool)
  val prim_kind_match_type : hol_type -> hol_type
                      -> ( (hol_type,hol_type) Lib.subst * hol_type list ) *
                         ( (kind,kind) Lib.subst * kind list ) * (rank * bool)
                      -> ( (hol_type,hol_type) Lib.subst * hol_type list ) *
                         ( (kind,kind) Lib.subst * kind list ) * (rank * bool)
  exception HIGHER_ORDER
  val RM            : hol_type list -> hol_type list
                      -> (hol_type,hol_type) Lib.subst * hol_type HOLset.set
                      -> (hol_type,hol_type) Lib.subst * hol_type HOLset.set
  val match_type_restr : hol_type list -> hol_type -> hol_type ->
                      (hol_type,hol_type)Lib.subst
  val match_type_in_context : hol_type -> hol_type
                              -> (hol_type,hol_type)Lib.subst
                              -> (hol_type,hol_type)Lib.subst
  val type_pmatch : hol_type HOLset.set -> {redex : hol_type, residue : hol_type} list ->
                    hol_type -> hol_type ->
                    (hol_type,hol_type)Lib.subst *
                    ((hol_type,hol_type)Lib.subst * hol_type * hol_type) list ->
                    (hol_type,hol_type)Lib.subst *
                    ((hol_type,hol_type)Lib.subst * hol_type * hol_type) list
  val type_homatch : kind list -> hol_type HOLset.set ->
                     rank * bool -> (kind,kind)Lib.subst * kind list ->
                     (hol_type,hol_type)Lib.subst *
                     ((hol_type,hol_type)Lib.subst * hol_type * hol_type) list ->
                     (hol_type,hol_type)Lib.subst
  val separate_insts_ty : bool -> rank * bool -> kind list ->
                          ((kind,kind)Lib.subst * kind list) ->
                          (hol_type,hol_type)Lib.subst ->
                          (hol_type,hol_type)Lib.subst ->
                          (hol_type, int)Lib.subst *
                          (hol_type,hol_type)Lib.subst *
                          ((kind,kind)Lib.subst * kind list) * (rank * bool)
  val get_rank_kind_insts : kind list -> {redex : hol_type, residue : hol_type} list ->
                            {redex : hol_type, residue : hol_type} list ->
                            (rank * bool) * ({redex : kind, residue : kind} list * kind list) ->
                            (rank * bool) * ({redex : kind, residue : kind} list * kind list)

  val ho_match_type0 : bool -> bool -> kind list -> hol_type HOLset.set -> hol_type -> hol_type
                       -> (hol_type,hol_type)Lib.subst * (kind,kind)Lib.subst * rank
  val ho_match_type  : bool -> kind list -> hol_type HOLset.set -> hol_type -> hol_type
                       -> (hol_type,hol_type)Lib.subst * (kind,kind)Lib.subst * rank
  val align_types : (hol_type,hol_type) Lib.subst ->
                    rank * (kind,kind) Lib.subst * (hol_type,hol_type) Lib.subst
  val thy_types     : string -> (string * int) list
  val thy_type_oprs : string -> (string * kind) list
  val type_size     : hol_type -> int

  val unbound_ty    : hol_type -> bool
  val pp_raw_type   : HOLPP.ppstream -> hol_type -> unit
  val type_to_string: hol_type -> string
end;
