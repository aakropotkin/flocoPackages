{

  inputs.packument.url   = "https://registry.npmjs.org/@sapphire/async-queue";
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
    scope = "@sapphire";
    ident = "@sapphire/async-queue";
    ldir  = "info/sapphire/async-queue";
    inherit packument fetchInfo;
  } // latest';

}
