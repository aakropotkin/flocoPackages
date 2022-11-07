{

  inputs.packument.url   = "https://registry.npmjs.org/p-locate?rev=11-8f2deda777109cd29367f0a08b0be23a";
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
    ident = "p-locate";
    ldir  = "info/unscoped/p/p-locate";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
