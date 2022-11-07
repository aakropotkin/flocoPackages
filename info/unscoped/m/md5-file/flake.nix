{

  inputs.packument.url   = "https://registry.npmjs.org/md5-file?rev=78-b679b205a71d7fdb0a429d51e3c6390c";
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
    ident = "md5-file";
    ldir  = "info/unscoped/m/md5-file";
    inherit packument fetchInfo;
  } // latest';

}
