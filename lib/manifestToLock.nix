{ dist, name, version, ... }: let
  fetchInfo = {
    type = "tarball";
    url  = dist.tarball;
  };
  fetchInfo = removeAttrs ( builtins.fetchTree fetchInfo ) ["outPath"];
  scope = let
    m = builtins.match "@([^@/]+)/.*" name;
  in if m == null then null else builtins.head m;
in {
  ident = name;
  inherit version scope fetchInfo;
  fetchInfo = fetchInfo // { inherit (fetchInfo) narHash; };
}
