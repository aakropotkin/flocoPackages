{

  inputs.packument.url   = "https://registry.npmjs.org/metro-cache-key?rev=33-c5ea953417316687c732b6281803b3d3";
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
    ident = "metro-cache-key";
    ldir  = "info/unscoped/m/metro-cache-key";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
