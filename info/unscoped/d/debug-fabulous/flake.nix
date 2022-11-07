{

  inputs.packument.url   = "https://registry.npmjs.org/debug-fabulous?rev=24-3399ad8f40a42fb6dd33889de1ab5249";
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
    ident = "debug-fabulous";
    ldir  = "info/unscoped/d/debug-fabulous";
    inherit packument fetchInfo;
  } // latest';

}
