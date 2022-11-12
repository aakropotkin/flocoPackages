{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/regenerate?_rev=54-bc33d84f5bcc444ce3f7a2aa19fc7a89";
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
    ident = "regenerate";
    ldir  = "info/unscoped/r/regenerate";
    inherit packument fetchInfo;
  } // latest';

}
