{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/storage-types?rev=2497-82026a106b2e9ca9d7baaf15466475d1";
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
    scope = "@firebase";
    ident = "@firebase/storage-types";
    ldir  = "info/firebase/storage-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
