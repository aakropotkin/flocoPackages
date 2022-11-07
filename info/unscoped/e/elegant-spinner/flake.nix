{

  inputs.packument.url   = "https://registry.npmjs.org/elegant-spinner?rev=11-ccab46cce7fabf8c5710d8fe6c081f1e";
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
    ident = "elegant-spinner";
    ldir  = "info/unscoped/e/elegant-spinner";
    inherit packument fetchInfo;
  } // latest';

}
