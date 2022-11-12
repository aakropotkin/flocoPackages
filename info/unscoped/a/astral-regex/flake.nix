{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/astral-regex?_rev=3-5319251479cb2cd1ae4075760c18f701";
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
    ident = "astral-regex";
    ldir  = "info/unscoped/a/astral-regex";
    inherit packument fetchInfo;
  } // latest';

}
