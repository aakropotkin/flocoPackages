{

  inputs.packument.url   = "https://registry.npmjs.org/yauzl?rev=70-3d38a97666a6a2b4e208093f434721f6";
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
    ident = "yauzl";
    ldir  = "info/unscoped/y/yauzl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
