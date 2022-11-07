{

  inputs.packument.url   = "https://registry.npmjs.org/styled-components?rev=436-de5caa61fddff251c60e378114a5ed14";
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
    ident = "styled-components";
    ldir  = "info/unscoped/s/styled-components";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
