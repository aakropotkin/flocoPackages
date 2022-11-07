{

  inputs.packument.url   = "https://registry.npmjs.org/amqplib?rev=119-5216a515e1e9098d60c216d488fd3f08";
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
    ident = "amqplib";
    ldir  = "info/unscoped/a/amqplib";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
