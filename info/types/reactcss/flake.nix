{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/reactcss?_rev=389-f56eef6121c9d23646391298915fe09c";
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
    ident = "@types/reactcss";
    ldir  = "info/types/reactcss";
    inherit packument fetchInfo;
  } // latest';

}
