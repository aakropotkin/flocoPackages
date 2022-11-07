{

  inputs.packument.url   = "https://registry.npmjs.org/for-in?rev=22-c17afbd1ff8ac21ae2f9f722ea3125ba";
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
    ident = "for-in";
    ldir  = "info/unscoped/f/for-in";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
