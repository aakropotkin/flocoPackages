{

  inputs.packument.url   = "https://registry.npmjs.org/jake?rev=320-ffe29cb21f6bd023a3840cfaee7725cf";
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
    ident = "jake";
    ldir  = "info/unscoped/j/jake";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
