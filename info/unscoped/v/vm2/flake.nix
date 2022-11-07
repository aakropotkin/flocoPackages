{

  inputs.packument.url   = "https://registry.npmjs.org/vm2?rev=81-6fce5dbdfcb2726b8fdb3490cb76fac4";
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
    ident = "vm2";
    ldir  = "info/unscoped/v/vm2";
    inherit packument fetchInfo;
  } // latest';

}
