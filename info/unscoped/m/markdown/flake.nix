{

  inputs.packument.url   = "https://registry.npmjs.org/markdown?rev=129-c4786c967d2103c16748e033f450b2d6";
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
    ident = "markdown";
    ldir  = "info/unscoped/m/markdown";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
