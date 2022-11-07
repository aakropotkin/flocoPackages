{

  inputs.packument.url   = "https://registry.npmjs.org/figlet?rev=111-9cbc7e5d83de713cedb923fce4ed041a";
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
    ident = "figlet";
    ldir  = "info/unscoped/f/figlet";
    inherit packument fetchInfo;
  } // latest';

}
