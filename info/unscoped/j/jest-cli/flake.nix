{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jest-cli?_rev=636-2476d674779d4aa3408bbbbad2cb075b";
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
    ident = "jest-cli";
    ldir  = "info/unscoped/j/jest-cli";
    inherit packument fetchInfo;
  } // latest';

}
