{

  inputs.packument.url   = "https://registry.npmjs.org/rc-input?rev=13-9357e0479e8551dd90c1e4c71731f5d1";
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
    ident = "rc-input";
    ldir  = "info/unscoped/r/rc-input";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
