{

  inputs.packument.url   = "https://registry.npmjs.org/posix-character-classes?rev=5-c4279174d1ca61ec4eb437cd444d0434";
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
    ident = "posix-character-classes";
    ldir  = "info/unscoped/p/posix-character-classes";
    inherit packument fetchInfo;
  } // latest';

}
