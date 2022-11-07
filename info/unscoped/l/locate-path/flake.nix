{

  inputs.packument.url   = "https://registry.npmjs.org/locate-path?rev=16-9505827a95ff7e50f592f04def39ba1c";
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
    ident = "locate-path";
    ldir  = "info/unscoped/l/locate-path";
    inherit packument fetchInfo;
  } // latest';

}
