{

  inputs.packument.url   = "https://registry.npmjs.org/pm2-axon?rev=33-e82998a7c962edbbda7daa3b142f23a2";
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
    ident = "pm2-axon";
    ldir  = "info/unscoped/p/pm2-axon";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
