{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fparse5?_rev=508-c3f99ea2b528cc8416febada2036f80e";
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
    scope = "@types";
    ident = "@types/parse5";
    ldir  = "info/types/parse5";
    inherit packument fetchInfo;
  } // latest';

}
