{

  inputs.packument.url   = "https://registry.npmjs.org/unc-path-regex?rev=7-aad1baba259c023274aab7b74def739c";
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
    ident = "unc-path-regex";
    ldir  = "info/unscoped/u/unc-path-regex";
    inherit packument fetchInfo;
  } // latest';

}
