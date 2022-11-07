{

  inputs.packument.url   = "https://registry.npmjs.org/is-arguments?rev=17-75d941b29f0efd9a7f824de11a1b3a29";
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
    ident = "is-arguments";
    ldir  = "info/unscoped/i/is-arguments";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
