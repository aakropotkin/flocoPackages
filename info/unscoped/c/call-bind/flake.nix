{

  inputs.packument.url   = "https://registry.npmjs.org/call-bind?rev=3-9d9ae2049303f24632778a4a244d4bea";
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
    ident = "call-bind";
    ldir  = "info/unscoped/c/call-bind";
    inherit packument fetchInfo;
  } // latest';

}
