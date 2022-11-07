{

  inputs.packument.url   = "https://registry.npmjs.org/streamfilter?rev=16-41f1a1fe3bde50960dadbe528710025d";
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
    ident = "streamfilter";
    ldir  = "info/unscoped/s/streamfilter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
