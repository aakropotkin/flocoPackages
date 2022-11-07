{

  inputs.packument.url   = "https://registry.npmjs.org/rc-drawer?rev=124-e022647749e120962599762612b1979a";
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
    ident = "rc-drawer";
    ldir  = "info/unscoped/r/rc-drawer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
