{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/trim-newlines?_rev=10-ac60117379dedacae526f9fb63e38656";
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
    ident = "trim-newlines";
    ldir  = "info/unscoped/t/trim-newlines";
    inherit packument fetchInfo;
  } // latest';

}
