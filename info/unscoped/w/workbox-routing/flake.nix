{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-routing?rev=103-fb87782aa0cad795c4e82af3dd6d5efc";
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
    ident = "workbox-routing";
    ldir  = "info/unscoped/w/workbox-routing";
    inherit packument fetchInfo;
  } // latest';

}
