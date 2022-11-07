{

  inputs.packument.url   = "https://registry.npmjs.org/iron?rev=99-c4ebc68ad2bb7a4d25ffabad25d2ffb1";
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
    ident = "iron";
    ldir  = "info/unscoped/i/iron";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
