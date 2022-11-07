{

  inputs.packument.url   = "https://registry.npmjs.org/tv4?rev=100-7dc4d66cf8cf66f3ca7612be8c8952c2";
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
    ident = "tv4";
    ldir  = "info/unscoped/t/tv4";
    inherit packument fetchInfo;
  } // latest';

}
