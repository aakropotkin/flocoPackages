{

  inputs.packument.url   = "https://registry.npmjs.org/ylru?rev=13-e204edf00186d4aaa0f905fa5690079c";
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
    ident = "ylru";
    ldir  = "info/unscoped/y/ylru";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
