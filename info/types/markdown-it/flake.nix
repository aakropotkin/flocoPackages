{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/markdown-it?_rev=691-403ed0dc6f69fa5c2b9080f122cf3677";
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
    ident = "@types/markdown-it";
    ldir  = "info/types/markdown-it";
    inherit packument fetchInfo;
  } // latest';

}
