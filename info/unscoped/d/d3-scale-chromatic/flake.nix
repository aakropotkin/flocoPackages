{

  inputs.packument.url   = "https://registry.npmjs.org/d3-scale-chromatic?rev=23-919bd834ac101d1b03d7aa60f84ff2da";
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
    ident = "d3-scale-chromatic";
    ldir  = "info/unscoped/d/d3-scale-chromatic";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
