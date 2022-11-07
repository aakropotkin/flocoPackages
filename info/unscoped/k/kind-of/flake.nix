{

  inputs.packument.url   = "https://registry.npmjs.org/kind-of?rev=68-608b03e28ded094a20fd2136311d8047";
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
    ident = "kind-of";
    ldir  = "info/unscoped/k/kind-of";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
