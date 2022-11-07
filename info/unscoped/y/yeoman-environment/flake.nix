{

  inputs.packument.url   = "https://registry.npmjs.org/yeoman-environment?rev=110-372dd48a82e7c8372a0f556f34b4de17";
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
    ident = "yeoman-environment";
    ldir  = "info/unscoped/y/yeoman-environment";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
