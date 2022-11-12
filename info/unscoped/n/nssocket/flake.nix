{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nssocket?_rev=92-b167f8826eb0bf2eadf47bf0b1f728cc";
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
    ident = "nssocket";
    ldir  = "info/unscoped/n/nssocket";
    inherit packument fetchInfo;
  } // latest';

}
