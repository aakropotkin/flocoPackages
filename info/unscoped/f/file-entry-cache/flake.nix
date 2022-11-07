{

  inputs.packument.url   = "https://registry.npmjs.org/file-entry-cache?rev=20-b3bada5f5d811ca18a7c08b4d6b831e6";
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
    ident = "file-entry-cache";
    ldir  = "info/unscoped/f/file-entry-cache";
    inherit packument fetchInfo;
  } // latest';

}
