{

  inputs.packument.url   = "https://registry.npmjs.org/common-ancestor-path?rev=2-d46e1953a27e15fcbc19ccafbae36545";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "common-ancestor-path";
    ldir  = "info/unscoped/c/common-ancestor-path";
    inherit packument fetchInfo;
  } // latest';

}
