{

  inputs.packument.url   = "https://registry.npmjs.org/jest-validate?rev=243-2e6455eea80525f5e7d268831841259e";
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
    ident = "jest-validate";
    ldir  = "info/unscoped/j/jest-validate";
    inherit packument fetchInfo;
  } // latest';

}
